#!/usr/bin/env bash
# correct R lapack library
ln -fs $CONDA_PREFIX/lib/R/modules/lapack.so $CONDA_PREFIX/lib/R/modules/libRlapack.so

# concoct_refine
PATH_concoctR=$(which concoct_refine)
sed -i 's/values/to_numpy/g' $PATH_concoctR
sed -i 's/as_matrix/to_numpy/g' $PATH_concoctR
sed -i 's/int(NK), args.seed, args.threads)/ int(NK), args.seed, args.threads, 500)/g' $PATH_concoctR

# check install
$STRONG_dir/SnakeNest/scripts/check_on_dependencies.py
