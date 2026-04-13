// SPDX-License-Identifier: MIT
package lazylambda.ops;

final class Join {

    /**
        Concats all string values of the source iterator, in order of iteration.
        @param src The source iterator.
        @param separator The separator to use.
        @param prefix Optional: The prefix to use.
        @param suffix Optional: The suffix to use.
        @return The final value.
    **/
    @:generic
    public static extern inline overload function join<S: Iterator<String>>(
        src: S,
        separator: String,
        prefix: String = "",
        suffix: String = ""
    ): String {
    
        final buffer = new StringBuf();
        if (prefix != "") {
            buffer.add(prefix);
        }
        
        while (src.hasNext()) {
            buffer.add(src.next());
            if (src.hasNext()) {
                buffer.add(separator);
            }
        }
        
        if (suffix != "") {
            buffer.add(suffix);
        }
        
        return buffer.toString();
    }
}
