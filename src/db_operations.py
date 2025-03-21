DATABASEFILE='../data/sits.ddb'  # path to persistent duckdb database file

def full_refresh_upload_to_db(DATABASEFILE, df, tablename):
    with duckdb.connect(DATABASEFILE) as con:
        con.sql(f"DROP TABLE IF EXISTS {tablename}")
        con.sql(f"CREATE TABLE {tablename} AS SELECT * FROM {df}")
        con.sql(f"SELECT COUNT(*) FROM {tablename}")