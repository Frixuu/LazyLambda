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
