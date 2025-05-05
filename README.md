# LazyLambda

![License](https://img.shields.io/github/license/Frixuu/LazyLambda?color=blue)
![Lint status](https://img.shields.io/github/actions/workflow/status/Frixuu/LazyLambda/lint.yml?label=lint)
![Build status](https://img.shields.io/github/actions/workflow/status/Frixuu/LazyLambda/test.yml?label=build)
[![Coverage](https://img.shields.io/codecov/c/github/Frixuu/LazyLambda?token=KnvBAvUChN)](https://codecov.io/gh/Frixuu/LazyLambda)

Functional iterators library for Haxe 4.2 and later.

Usage:

```haxe
using lazylambda.Prelude;
```

```haxe
array.iterator()
    .take(10)
    .filter(i -> i < 100)
    .map(i -> Std.string(i + 1))
    .join(", ");
```

## How does it compare to…

- [Lambda](https://haxe.org/manual/std-Lambda.html), from the standard library:
It's in the name.
While the standard library functions are eager, that is resolve immediately,
LazyLambda only processes the iterators when their items are needed.
This approach can be sometimes noticably faster.
(Plus, I'm not a fan of its function naming schemes.)
- [yar3333/stdlib](https://github.com/yar3333/haxe-stdlib):
This is a general-purpose library, so it's not a one-to-one comparison,
but its facilities seem focused on `Array`s specifically
instead of iterators in general.
- [SomeRanDev/MagicArrayTools](https://github.com/SomeRanDev/Haxe-MagicArrayTools):
It's magic!
No, literally.
If all you need is for your app to be as performant as possible,
you won't go wrong with this library.
That being said, it's basically one giant macro,
and macros tend to have their quirks and special handling requirements.
Its code may also be difficult to grasp when wanting to extend it.
- [LPeter1997/itertools](https://github.com/LPeter1997/Haxe.itertools):
This one is the most similar as it tries to reach exactly the same design goals,
BUT it fails, in my opinion, in a one crucial way:
its function signatures. They consume and produce `Iterable`s instead of `Iterator`s.
This approach needlesly allocates extra wrappers, closures,
and generally makes it harder for the compiler to optimize away.
