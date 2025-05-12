// SPDX-License-Identifier: MIT
package lazylambda.ops;

final class Match {

    /**
        Checks if the source iterator contains any items that match the predicate.
        @param src The source iterator.
        @param predicate The predicate function.
        @return `true` if any item matches the predicate, `false` otherwise.
    **/
    @:generic
    public static extern inline overload function anyMatch<S: Iterator<T>, T>(
        src: S,
        predicate: (item: T) -> Bool
    ): Bool {
        var retval: Bool = false;
        while (src.hasNext()) {
            if (predicate(src.next())) {
                retval = true;
                break;
            }
        }
        return retval;
    }
    
    /**
        Checks if all of the items in the source iterator match the predicate.
        @param src The source iterator.
        @param predicate The predicate function.
        @return `true` if all items match the predicate or the iterator is empty, `false` otherwise.
    **/
    @:generic
    public static extern inline overload function allMatch<S: Iterator<T>, T>(
        src: S,
        predicate: (item: T) -> Bool
    ): Bool {
        var retval: Bool = true;
        while (src.hasNext()) {
            if (!predicate(src.next())) {
                retval = false;
                break;
            }
        }
        return retval;
    }
    
    /**
        Checks if none of the items in the source iterator match the predicate.
        @param src The source iterator.
        @param predicate The predicate function.
        @return `true` if no items match the predicate or the iterator is empty, `false` otherwise.
    **/
    @:generic
    public static extern inline overload function noneMatch<S: Iterator<T>, T>(
        src: S,
        predicate: (item: T) -> Bool
    ): Bool {
        var retval: Bool = true;
        while (src.hasNext()) {
            if (predicate(src.next())) {
                retval = false;
                break;
            }
        }
        return retval;
    }
}
