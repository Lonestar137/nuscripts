#!/usr/bin/env -S nu

use std log


let INSTALL_LOCATION = $"($env.HOME)/.local/bin"

def gitHelpers [] {
  log info $"Installing Git helpers to ($INSTALL_LOCATION)."
  mkdir $"($INSTALL_LOCATION)"  
  ln -sf $"($env.FILE_PWD)/git_helpers/gd.nu" $"($INSTALL_LOCATION)/gd"
  ln -sf $"($env.FILE_PWD)/git_helpers/olgit.nu" $"($INSTALL_LOCATION)/olgit"
}

def sshHelpers [] {
  log info $"Installing SSH helpers to ($INSTALL_LOCATION)."
  mkdir $INSTALL_LOCATION
  ln -sf $"($env.FILE_PWD)/ssh_helpers/ssm.nu" $"($INSTALL_LOCATION)/ssm"
}

def noteHelpers [] {
  log info $"Installing Note helpers to ($INSTALL_LOCATION)."
  mkdir $INSTALL_LOCATION
  ln -sf $"($env.FILE_PWD)/note_helpers/nf.nu" $"($INSTALL_LOCATION)/nf"
  ln -sf $"($env.FILE_PWD)/note_helpers/md.nu" $"($INSTALL_LOCATION)/md"
}


def "main note_helpers" [] {
  noteHelpers
}

def "main ssh_helpers" [] {
  sshHelpers
}

def "main git_helpers" [] {
  gitHelpers
}

def main [] {
  gitHelpers
  sshHelpers
  noteHelpers

  if $INSTALL_LOCATION not-in $env.PATH {
    print $"($INSTALL_LOCATION) not in PATH.  Add it to make scripts available."
  }
}
