# mxl

mxl (Mail X-Label) is a small utility that add or remove label from
the X-Label field of an e-mail.

The heavy work is done by formail(1) under the hood. mxl is just a wrapper on
top.

## What mxl does

- Always return the original e-mail if no modification happened
- Add X-Label field if it is missing when adding a label
- Add a label into the X-Label field
- Remove a label from the X-Label field
- Remove the X-Label field if the last label is removed
- Return the original e-mail untouched to stdout in any other case

## What mxl does not

- Managed any other other header's fields
- Take any other argument than 1 label
- Write anything on disk

## Usage

Add a label:

    $ mxl -a label < /path/to/mail

Remove a label

    $ mxl -r label < /path/to/mail

## License

GPLv3

## Authors

Mayeu, Matthieu, Maury <m@mayeu.me>
