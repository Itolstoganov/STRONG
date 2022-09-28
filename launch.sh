#!/usr/bin/env bash
if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` <output directory with config.yaml file>"
  exit 0
fi
snakemake --directory $1 --keep-going -j 999999 --cluster "sbatch -A {cluster.account} -n {cluster.n} -t {cluster.runtime} -J {cluster.jobname} --mail-type={cluster.mail_type} --mail-user={cluster.mail}" --cluster-config SnakeNest/cluster.json --config LOCAL_DIR=/crex/proj/snic2022-6-31/nobackup/ivan/tools/STRONG --configfile=$1/config.yaml --latency-wait 120 -k -p -r --verbose --snakefile SnakeNest/SCogSubGraph.snake --rerun-incomplete 
