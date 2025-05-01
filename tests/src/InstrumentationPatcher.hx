// SPDX-License-Identifier: MIT
package;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;

using lazylambda.Prelude;
#end

final class InstrumentationPatcher {

    public static macro function patch(): Array<Field> {
        final fields: Array<Field> = Context.getBuildFields();
        final field = fields.iterator().firstOrThrow(f -> f.name == "workspaceFolder");
        switch (field.kind) {
            case FFun(f):
                field.access.remove(AMacro);
                f.ret = macro : String;
                f.expr = macro {return Sys.getCwd();};
            case _:
                throw "Unexpected field kind";
        }
        return fields;
    }
}
