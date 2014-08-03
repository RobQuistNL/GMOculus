#define GMO extern "C" __declspec (dllexport)

double VERSION = 2;

GMO double getVersion() {
	return VERSION;
}

GMO double initialize() {
	return 1;
}

GMO double uninitialize() {
	return 1;
}


GMO double getYaw() {
	return 1;
}

GMO double getPitch() {
	return 2;
}

GMO double getRoll() {
	return 3;
}