package dittner.async.utils {

public function doLaterInFrames(method:Function, delayFrames:uint = 2):Number {
	return FTimer.execFunc(method, delayFrames);
}
}