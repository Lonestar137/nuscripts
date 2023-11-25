#!/usr/bin/env -S nu --stdin


const base_dir = "/tmp/gd"
const histo_file = "gd.csv"

def main [path: string] {

  let file_path = $"($base_dir)/($histo_file)"
  let abs_path = $path | path expand
  let new_record = date now | date to-record | insert cd_dir $abs_path 

  if ($path | path exists) {
    let file = if ($file_path | path exists) {
      (open $file_path | append $new_record)
    } else {
      mkdir $base_dir
      touch $file_path
      $new_record
    }

    $file | save --force $file_path
    let full_file  = open $file_path
    let histo = $full_file | histogram cd_dir

    let new_path_record = $histo | find $path | first
    let go_to = $new_path_record | get cd_dir
  
    print $go_to
  } else {
    # TODO: find the most likely and append it.
    print "Path does not exist."
  }
}
