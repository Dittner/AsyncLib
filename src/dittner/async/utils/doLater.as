package dittner.async.utils {
import dittner.async.AsyncCallbacksLib;

public function doLater(method:Function, delayMSec:int = 50):Number {
	return FTimer.execFunc(method, Math.ceil(AsyncCallbacksLib.fps * delayMSec / 1000));
}
}