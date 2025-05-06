// SPDX-License-Identifier: MIT
package lazylambda;

import haxe.Exception;
import haxe.PosInfos;
import haxe.exceptions.PosException;

/**
    A standard exception thrown when an item is expected
    (e.g. in `.next()` or `.firstOrThrow()`),
    but there are none available.
**/
class NoItemsException extends PosException {

    public function new(?previous: Exception, ?pos: PosInfos) {
        super("Iterator has no items to yield", previous, pos);
    }
}
