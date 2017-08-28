HOME_ROOT=/opt/jupengfei/.qk/.
QD_DB_FILE=$HOME_ROOT/db/qd.db
QD_DB_TOP=10

log_message () {
    echo -e $@
}

get_cache_list () {
    cut -d: -f2 $QD_DB_FILE
}
