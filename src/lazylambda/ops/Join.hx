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
    public static inline function join(
        src: Iterator<String>,
        separator: String,
        prefix: String = "",
        suffix: String = ""
    ): String {
    
        final buffer = new StringBuf();
        buffer.add(prefix);
        
        while (src.hasNext()) {
            buffer.add(src.next());
            if (src.hasNext()) {
                buffer.add(separator);
            }
        }
        
        buffer.add(suffix);
        return buffer.toString();
    }
}
