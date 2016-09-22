package de.dittner.async.utils {
public function invalidateOf(validateFunc:Function):void {
	Invalidator.add(validateFunc);
}
}