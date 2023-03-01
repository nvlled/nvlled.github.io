# nvlled.github.io

This repository contains the source and HTML files
for my personal website found at (nvlled.github.io)[https://nvlled.github.io].
I use my own static site generator [cita.tsx](https://github.com/nvlled/cita.tsx) 
for building the site.
    
## Setup
Install and setup [deno](https://deno.land/manual@v1.31.1/getting_started)
    
## Building the HTML files
```typescript
$ cd path/to/nvlled.github.io/src
$ ./cita.tsx build
```

## Development
First, change directory in the src/ directory
```
$ cd path/to/nvlled.github.io/src
```
> All the subsequent commands assumes you are in src/
> directory, otherwise they may not work.

Start the development server,
then open the browser at http://localhost:8000, or what the actual url shown
```
$ ./cita.tsx dev
```

Open vscode or your editor on the src/ directory
```
$ vscode .
```
Make and save your changes to any page .tsx file.
Then view your browser and reload to see changes.

### Auto-reload (optional)
You can avoid manual page reloads by running the script
```
$ ./tools/dev-browser.ts
```
This will open up a new browser window that
automatically reloads when you change a file.
You may want to edit the browser executable path,
or see puppeeterjs documentation for more details.

### Creating new pages
```
$ ./cita.tsx example-page.tsx
$ ./cita.tsx path/to/new/another-page.tsx
```

### Deleting pages
```
$ rm some-page.tsx
$ ./cita.tsx sitemap
```

> Note: When adding or deleting pages, you may need to
> run `$ ./cita.tsx sitemap` and restart the devopment server.


### Typechecking the pages
Your editor (vscode in particular) should do the typechecking.
But if you want to check all pages in one go, or are seeing
some tricky runtime error, run the following:
```
deno check ./cita.tsx
```
