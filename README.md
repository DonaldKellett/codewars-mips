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
- `tag-collision`: Example of two functions with the same name in different files, leading to an error
- `pascal`: Example of computing Pascal's triangle using a `factorial` function preloaded for the solver

## License

[MIT](./LICENSE)
