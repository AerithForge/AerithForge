Coding style of the project

### Documentation

The source code is treated as an e-book for general public with fundamental understanding of relevant concepts, thus each file should start with a documentation explaining what the file is and what it is used for:

```sh
###! # Example file
###! Demonstration of file documentation, outputs the common hello world

printf "%s\n" "Hello, World!"
```

#### Directories

Each directory is expected to have a `README.md` with minimal of short explanation what the directory is designed to hold to be used as a form of road sign

```md
Examples of how to write the source code
```

#### Variables

For variable documentation use the following:

```sh
my_cool_variable="cool" # Cool variable storing cool stuff```
```

As it makes the comment clearly visible when searching the source code

#### Functions

Use `#?` comment for documenting the functions as we have a code-editor optimized to highlight these while declaring a clear destinction from regular comments for book formatting

```sh
#? Function that upon calling shows a random XKCD.com comic
#? Credit: https://www.shell-fu.org/tips.php?id=878
random_xkcd_comic() {
  # Use the upstream-provided random comic generator and transform it into an HTML string for `display` to show
  wget http://dynamic.xkcd.com/comic/random/ -O -| grep <img src="http://imgs.xkcd.com/comics |
  sed s/<img src="// | sed s/"[a-z]*.*// | wget -i - -O -| display
}
```

### Indentation

refer to the editorconfig in the repository, in general we use the indentation of 1 tab of 2 width

### Prohibited functionalities of BASH

#### Arrays

Arrays are non-POSIX so their use is discourages and limited where possible

#### `declare`

it's functionality is considered inappropriate for a scripting language, we expect proper handling of variables instead of trying to set them as read-only


#### `echo`

Non-standard command across platforms (e.g. does different things in linux vs freebsd), thus replaced with `printf`

#### `pushd`/`popd`

TBD - They are undefined in POSIX and their use in code seems to encourage over-complication

### Programming practices

#### Perform Self-Review and tag any problematic code

It's not always possible to write the best version of the code on the first try and you are not expected to try to do that, when writing code and documenting it try to evaluate it's possible issues and tag them so that they can be addressed by your collegue.

```sh
# FIXME-QA(Tony): This is using `rm` in a dangerous way and should be sanitized
# FIXME-QA(Tony): We should implement a check to invoke this command only if `/directory` exists to avoid unexpected runtime
# FIXME(Tony): For some reason it doesn't want to remove the directory unless i parse `--no-preserve-roof`?
# FIXME-QA(Tony): Do we even need the --force flag?
# We are done with processing in /directory and can remove it now
rm -rf --no-preserve-roof /directory
```

Bad code with tags is often mergable and so by tagging the issues with the code you are less likely to be pestered about them during a review which saves time on both the developer and reviewer's side as tags are up for grabs for your collegues and public to fix without the need of coordination from the project management.

Sometimes the reviewers will fix the issues for you, because you did a good job taging the code and explaining the known issues so that they might know a better solution:

```sh
# We are done with processing in /directory and can remove it now
[ ! -d "/directory" ] || rm --recursive /directory
```

Note that tags are not magic solution that allows you to write a crappy code and get it merged, in this scenario we are using `rm` as a priviledged user with a `--force` flag and `--no-preserve-roof` (mangled for safety) so if the issue is severe your tags might be changed by the reviewer and mandated to be fixed.

```sh
# DNM-SECURITY(Krey): `--no-preserve-roof` is going to get merged over my dead body
# DNM-QA(Krey): There is no reason for `--force` flag
# We are done with processing in /directory and can remove it now
rm -rf --no-preserve-roof /directory
```

DO-NOT-MERGE (DNM) tags block merging until the problem is resolved. Constant submitting of bad code will result in limited merge access and requiring a mentor to assist you with contributions and submit contributions for you until your mentor has faith in your ability to contribute to the project.

Refer to `TAGS.md` file for details on how to use tags

#### Eval is evil!

Avoid the use of `eval` whenever possible as it can be used for code injection and is painful and resource demanding to sanitize

Refer to https://mywiki.wooledge.org/BashFAQ/048
#### Write conditionals to process false instead of true return

We are using `set -e` which means that the framework will exit on `false` return, thus try to avoid writing conditionals that process `true` as the return of `false` might make the script to fail early

```sh
# Unwanted
[ -d "/directory" ] && rm -r "/directory"

# Wanted
[ ! -d "/directory" ] || rm -r "/directory"
```

#### Avoid Useless Square Brackets

```sh
# Unwanted
[[ something == nothing ]] || ..


# Wanted
[ something = nothing ] || ..
```

The POSIX-style declaration is more readable and easier to work with as evident by the smaller declaration

#### Avoid Useless Braces Around Variables

```sh
# Unwanted
${VARIABLE}

# Wanted
$VARIABLE
```

Braces should only be used when expending variables:

```sh
${VARIABLE:-"default-value"}
${VARIABLE//regex-substitution//}
```

it's use outside this scenario is bloating the code

#### shellcheck source=/dev/null is prohibited

Implement a proper logic handling instead of declaring `shellcheck source=/dev/null` as in the example:

```sh
source_family_config_and_arch() {
	declare -a family_source_paths=("$SRC/config/sources/families/$LINUXFAMILY.conf" "$USERPATCHES_PATH/config/sources/families/$LINUXFAMILY.conf")
	declare -i family_sourced_ok=0
	declare family_source_path
	for family_source_path in "${family_source_paths[@]}"; do
		[ -f "$family_source_path" ] || continue

		display_alert "Sourcing family configuration" "${family_source_path}" "info"
		# shellcheck source=/dev/null
		. "$family_source_path"

		# @TODO: reset error handling, go figure what they do in there.

		family_sourced_ok=$((family_sourced_ok + 1))
	done
	...
```

Shellcheck is here to help you, don't try to silence it's warnings
#### Mentions of Armbian

The `Armbian` is the base upon which we built AerithForge and it's often using variables such as `ARMBIAN_` which are expected to be replaced with neutral `FRAMEWORK_` as well as any other mention of the original project

### Problems

#### Variable Naming Convertion

The variable naming conversion all messed up from the previous base, do not try to make small fixes as that would make the code into even bigger mess, the solution to this has to be a huge and coordinated refactor