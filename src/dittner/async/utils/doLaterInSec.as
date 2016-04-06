package dittner.async.utils {
import dittner.async.AsyncCallbacksLib;

public function doLaterInSec(method:Function, delaySec:uint = 1):Number {
	return FTimer.execFunc(method, Math.ceil(delaySec * AsyncCallbacksLib.fps));
}
}