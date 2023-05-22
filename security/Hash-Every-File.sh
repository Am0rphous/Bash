#!/bin/bash

#hasing av alle filer i ei mappe (NAS synology)
sha256sum *

#hashing av alle filer i ei mappe
for i in *
 do
   shasum -a 256 $i
done

#or
shasum -a 256 *
