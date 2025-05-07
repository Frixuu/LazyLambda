// SPDX-License-Identifier: MIT
package lazylambda.ds;

/**
    An immutable, two-element tuple.
**/
final class Pair<L, R> {

    /**
        The first element of the tuple.
    **/
    public final left: L;
    
    /**
        The second element of the tuple.
    **/
    public final right: R;
    
    public inline function new(left: L, right: R) {
        this.left = left;
        this.right = right;
    }
}
