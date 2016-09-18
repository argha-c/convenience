#! /bin/bash
set -e

volumes=$(docker volume ls | awk '{if(NR>1) print $2}')

if [ ${#volumes[@]} -le 1 ];then
  echo No volumes eligible for deletion.
else
  for vol in "${volumes[@]}"; do
    docker volume rm ${vol}
  done
fi
echo Successfully deleted ${#volumes[@]} orphaned volume\(s\)!
