// SPDX-License-Identifier: MIT
package lazylambda.ds;

typedef Comparable<T> = {

    /**
        Naturally compares this instance to another.
        @param other The other instance.
        @return A negative integer if this instance is less than the other,
                a positive integer if this instance is greater than the other,
                or zero if they are equal.
    **/
    function compareTo(other: T): Int;
}
