"""Exercise the real Nightfox plugin without loading or modifying the user config."""
import json
import os
from pathlib import Path
import pty
import select
import shutil
import signal
import subprocess
import tempfile
import time
import unittest

ROOT = Path(__file__).resolve().parents[1]
PLUGIN = Path(os.environ.get("NIGHTFOX_PATH", Path.home() / ".local/share/nvim/lazy/nightfox.nvim"))


@unittest.skipUnless(shutil.which("nvim") and PLUGIN.is_dir(), "nvim and NIGHTFOX_PATH required")
class Appearance(unittest.TestCase):
    def exercise(self, mode, tty=False, late=False):
        with tempfile.TemporaryDirectory(prefix="nvim-appearance-") as tmp:
            home = Path(tmp)
            result = home / "result"
            init = home / "init.lua"
            startup = "" if tty else f'vim.o.background = "{mode}"\n'
            late_change = 'vim.o.background = "light"; ' if late else ""
            init.write_text(f'vim.opt.rtp:prepend({json.dumps(str(ROOT))})\n'
                f'vim.opt.rtp:prepend({json.dumps(str(PLUGIN))})\n' + startup +
                'require("config.terminal_appearance").setup()\n'
                'require("config.terminal_appearance").setup()\n'
                'vim.defer_fn(function() ' + late_change +
                f'vim.fn.writefile({{vim.o.background, vim.g.colors_name}}, {json.dumps(str(result))}); '
                'vim.cmd("qa!") end, 500)\n')
            env = dict(os.environ, HOME=tmp, XDG_CACHE_HOME=tmp + "/cache", XDG_STATE_HOME=tmp + "/state",
                       XDG_DATA_HOME=tmp + "/data", TERM="xterm-256color", LIGHT_MODE="WRONG")
            argv = [shutil.which("nvim"), "-u", str(init), "-i", "NONE"]
            if not tty:
                run = subprocess.run(argv + ["--headless"], env=env, capture_output=True, text=True, timeout=10)
                self.assertEqual(run.returncode, 0, run.stderr)
            else:
                pid, fd = pty.fork()
                if pid == 0:
                    os.execvpe(argv[0], argv, env)
                rgb = b"ffff/ffff/ffff" if mode == "light" else b"0000/0000/0000"
                queries = {b"\x1b]11;?\x07": b"\x1b]11;rgb:" + rgb + b"\x07",
                           b"\x1b]11;?\x1b\\": b"\x1b]11;rgb:" + rgb + b"\x1b\\",
                           b"\x1b[c": b"\x1b[?1;2c", b"\x1b[0c": b"\x1b[?1;2c"}
                pending = b""
                try:
                    deadline = time.monotonic() + 8
                    while time.monotonic() < deadline:
                        if not select.select([fd], [], [], 0.1)[0]:
                            continue
                        try:
                            chunk = os.read(fd, 65536)
                        except OSError:
                            break
                        if not chunk:
                            break
                        pending += chunk
                        while any(q in pending for q in queries):
                            query = min((q for q in queries if q in pending), key=pending.index)
                            pending = pending[pending.index(query) + len(query):]
                            os.write(fd, queries[query])
                    else:
                        self.fail("Neovim PTY timed out")
                finally:
                    os.close(fd)
                    ended, status = os.waitpid(pid, os.WNOHANG)
                    if not ended:
                        os.kill(pid, signal.SIGKILL)
                        _, status = os.waitpid(pid, 0)
                self.assertEqual(os.waitstatus_to_exitcode(status), 0)
            expected = "light" if late else mode
            self.assertEqual(result.read_text().splitlines(),
                             [expected, "dayfox" if expected == "light" else "duskfox"])

    def test_initial_background(self):
        for mode in ("light", "dark"):
            self.exercise(mode)

    def test_late_background_response(self):
        self.exercise("dark", late=True)

    def test_real_terminal_query(self):
        for mode in ("light", "dark"):
            self.exercise(mode, tty=True)


if __name__ == "__main__":
    unittest.main()
