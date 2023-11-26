#!/usr/bin/env -S nu --stdin


def main [path: string] {
  python3.10 $"($env.FILE_PWD)/md.py" $path
}
