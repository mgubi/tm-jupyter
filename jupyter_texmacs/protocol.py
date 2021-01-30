#!/usr/bin/env python
###############################################################################
##
## MODULE      : protocol.py
## DESCRIPTION : The TeXmacs plugin protocol impl
## COPYRIGHT   : (C) 2004  Ero Carrera, ero@dkbza.org
##               (C) 2012  Adrian Soto
##               (C) 2014  Miguel de Benito Delgado, mdbenito@texmacs.org
##               (C) 2019  Darcy Shen
##
## This software falls under the GNU general public license version 3 or later.
## It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
## in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.

import os
import re

DATA_BEGIN = chr(2)
DATA_END = chr(5)
DATA_ESCAPE = chr(27)
DATA_COMMAND = chr(16)

TM_DEBUG = False

def data_begin():
    """Signal the beginning of data to TeXmacs."""
    os.sys.stdout.write(DATA_BEGIN)


def data_end():
    """Signal the end of data to TeXmacs."""
    os.sys.stdout.write(DATA_END)
    os.sys.stdout.flush()


def texmacs_escape(data):
    return data.replace(DATA_BEGIN.encode(), (DATA_ESCAPE + DATA_BEGIN).encode()) \
               .replace(DATA_END.encode(), (DATA_ESCAPE + DATA_END).encode())

def filter_ansi(text):
    # FIlter out ansi color codes
    # TODO: use regex matches to substitute with TeXmacs Scheme tags and flush_scheme
    #
    # https://en.wikipedia.org/wiki/ANSI_escape_code#Colors 
    # CSI n m sets the appearance of the characters with n the SGR param
    # where
    # CSI is 'ESC ['
    # and
    # SGR param 30 to 37 select the foreground color
    # SGR code 1 is bold
    # SGR code 0 resets the appearance

    # match opening \x1B\[ followed by 30-37, 0, 1 or 01 one or more times seperated by ; and closed by m. Use matching groups to retrieve the codes.
    ansi_color_re = re.compile(r'\x1B\[(3[0-7]|0|0?1)(?:;(3[0-7]|0|0?1))*m')
    return ansi_color_re.sub('', text) 

def flush_any (out_str):
    """Feed data back to TeXmacs.

    Output results back to TeXmacs, with the DATA_BEGIN,
    DATA_END control characters."""
    data_begin()
    os.sys.stdout.write(filter_ansi(out_str))
    data_end()

def flush_verbatim(content):
    flush_any ("verbatim:" + content)

def flush_prompt(prompt):
    flush_any ("prompt#" + prompt)

def flush_command(command):
    flush_any ("command:" + command)

def flush_scheme(scheme):
    flush_any ("scheme:" + scheme)

def flush_file(path):
    flush_any ("file:" + path)

def flush_ps(content):
    flush_any ("ps:" + content)

def flush_err(content):
    os.sys.stderr.write(DATA_BEGIN)
    os.sys.stderr.write("verbatim:" + filter_ansi(content))
    os.sys.stderr.write(DATA_END)
    os.sys.stderr.flush() 
    
def flush_debug(content):
    if TM_DEBUG:
        flush_err(content)
