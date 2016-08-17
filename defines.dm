//mob/var/stat things
#define DEAD		1 << 1
#define LYING		1 << 2
#define BROKEN_R_ARM		1 << 3
#define BROKEN_L_ARM		1 << 4
#define BROKEN_R_LEG		1 << 5
#define BROKEN_L_LEG		1 << 6
#define BUCKLED		1 << 7
#define AMP_R_ARM		1 << 8
#define AMP_L_ARM		1 << 9
#define AMP_R_LEG		1 << 10
#define AMP_L_LEG		1 << 11

mob
	var/stat = 0