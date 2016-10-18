A = LOAD '$INPUT' using PigStorage(':') as (username:chararray, password:chararray, uid:int, gid:int, description:chararray, homedir:chararray, loginshell:chararray);
B = FILTER A BY loginshell != '/sbin/nologin' AND loginshell != '/bin/false';
C = FOREACH B GENERATE username, homedir;
STORE C INTO '$OUTPUT';