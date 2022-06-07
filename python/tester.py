from dataclasses import dataclass
import os
import subprocess
from assertpy import assert_that
from obdev_utils.common import run_args, get_logger, Args


@dataclass
class CliTest:
    args: Args
    stdout: str
    stderr: str
    exit_code: int


def run_test(test: CliTest):
    result = run_args(test.args)
    assert_that(test.stdout.strip()).is_equal_to(result.stdout.strip())
    # assert test.stderr == result.stderr.decode()
    # assert test.exit_code == result.returncode


if __name__ == "__main__":
    ct = CliTest("echo 1".split(), "1", "", 0)
    run_test(ct)
