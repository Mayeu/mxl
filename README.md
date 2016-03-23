# mxl

mxl (Mail X-Label) is a small utility that add or remove label from
the X-Label field of an e-mail.

The heavy work is done by formail(1) under the hood. mxl is just a wrapper on
top.

It aims to:
- play well with the rewrite command of fdm(1)
- be posix compliant

## WIP

This is a wip, it is not feature complete, beware.

Feature list:
- [x] add label to a mail
- [ ] don't add duplicate label
- [ ] remove label from a mail
- [ ] remove X-Label when there is no label anymore

## What mxl does

- Always return the e-mail on stdout
- Add the X-Label field if it is missing when adding a label
- Add a label into the X-Label field
- Remove a label from the X-Label field
- Remove the X-Label field if the last label is removed
- Return the original e-mail untouched to stdout in any other case

## What mxl does not

- Managed any other other header's fields
- Take any other argument than 1 label
- Write anything back on disk

## Usage

Add a label:

    $ mxl -a label < /path/to/mail

Remove a label

    $ mxl -r label < /path/to/mail

## Testing

A test suite can be found into the `test` folder. It can be run with
bats(1), or directly with `make test`

## Semantic versionning

This project follow the [Semantic Versioning
scheme](http://semver.org/). A breking change is a change in the
public API, here it concern a change that will change the behaviour
of the command line options of the program.

## License

GPLv3

## Authors

Mayeu, Matthieu, Maury <m@mayeu.me>
