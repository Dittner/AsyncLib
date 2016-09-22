package de.dittner.async.utils {
import de.dittner.async.AsyncCallbacksLib;

import flash.events.Event;
import flash.events.EventDispatcher;

public class FrameTimer extends EventDispatcher {
	public function FrameTimer(delayFrames:uint, callbackFunc:Function) {
		super();
		this.delayFrames = delayFrames == 0 ? 1 : delayFrames;
		completeFunc = callbackFunc;
		if (completeFunc == null) throw new Error("callbackFunc == null!");
		if (!AsyncCallbacksLib.stage) throw new Error("Set at first stage using by Async class")
	}

	//----------------------------------------------------------------------------------------------
	//
	//  Variables
	//
	//----------------------------------------------------------------------------------------------

	private var delayFrames:uint;
	private var completeFunc:Function;
	private var wentFrames:uint = 0;

	//----------------------------------------------------------------------------------------------
	//
	//  Properties
	//
	//----------------------------------------------------------------------------------------------

	//--------------------------------------
	//  running
	//--------------------------------------
	private var _running:Boolean = false;
	public function get running():Boolean {return _running;}
	private function setRunning(value:Boolean):void {
		if (_running != value) {
			_running = value;
		}
	}

	//----------------------------------------------------------------------------------------------
	//
	//  Methods
	//
	//----------------------------------------------------------------------------------------------

	public function reset():void {
		wentFrames = 0;
	}

	public function start():void {
		if (!running) {
			setRunning(true);
			AsyncCallbacksLib.stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
	}

	public function stop():void {
		if (running) {
			setRunning(false);
			wentFrames = 0;
			AsyncCallbacksLib.stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
	}

	private function enterFrameHandler(event:Event):void {
		wentFrames++;
		if (wentFrames >= delayFrames) {
			setRunning(false);
			AsyncCallbacksLib.stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			wentFrames = 0;
			completeFunc();
		}
	}
}
}
