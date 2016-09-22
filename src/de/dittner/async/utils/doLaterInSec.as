package de.dittner.async.utils {
import de.dittner.async.AsyncCallbacksLib;

public function doLaterInSec(method:Function, delaySec:uint = 1):Number {
	return FTimer.execFunc(method, Math.ceil(delaySec * AsyncCallbacksLib.fps));
}
}