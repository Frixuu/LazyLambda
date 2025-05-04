// SPDX-License-Identifier: MIT
package lazylambda;

import haxe.Exception;
import haxe.PosInfos;
import haxe.exceptions.PosException;

class NoItemsException extends PosException {

    public function new(?previous: Exception, ?pos: PosInfos) {
        super("Iterator has no items to yield", previous, pos);
    }
}
