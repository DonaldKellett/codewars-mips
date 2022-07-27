# MIPS

Container image for MIPS used by CodeRunner.

## Usage

```bash
$ ./bin/run
```

Specify a container engine (default: `docker`) with environment variable `CONTAINER_ENGINE`. E.g. with Podman:

```bash
$ CONTAINER_ENGINE=podman ./bin/run
```

Specify an example within the `examples/` directory to run (default: `multiply`) by passing a command-line argument. E.g. to run the example under `examples/pascal/`:

```bash
$ ./bin/run pascal
```

## Examples

- `multiply` (default): Minimal example of `multiply` function and test cases
- `multiply-failing`: Like `multiply`, but with a failing implementation
- `label-collision`: Example of two functions with the same name in different files, leading to an error
- `pascal`: Example of computing Pascal's triangle using a `factorial` function preloaded for the solver
- `string-reverse`: Example of string reverse function and test cases
- `string-reverse-failing`: Like `string-reverse`, but with a failing implementation
- `array-reverse`: Example of array reverse function and test cases
- `array-reverse-failing`: Like `array-reverse`, but with a failing implementation

## Building

```bash
$ docker build -t ghcr.io/codewars/mips:latest .
```

## License

[MIT](./LICENSE)
