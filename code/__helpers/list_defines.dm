#define CLIENT(x) x && all_clients[x] ? all_clients[x] : null
#define MOBDATA(x) x && ckey_to_mobdata[x] ? ckey_to_mobdata[x] : null
#define GLOBALDATA(x) x && ckey_to_globaldata[x] ? ckey_to_globaldata[x] : null
#define AREA(x) x && SSarea.all_areas[x] ? SSarea.all_areas[x] : null
#define JOB(x) x && SSjob.all_jobs[x] ? SSjob.all_jobs[x] : null
#define ARMOR(x) x && SSarmor.all_armors[x] ? SSarmor.all_armors[x] : null