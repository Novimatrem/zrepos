#!/usr/bin/env python3

# Usage: python3 mail-link-v3.py "insert post title here"

from urllib.parse import quote
import sys

# Constants:

email_addr = "TheNovimatrem@protonmail.ch"
prefix = "RE: Social post - "
link_text = "Reply"

def make_subject(title):
    """constructs the subject"""
    return prefix + title

def make_link(to, subj, text):
    """builds an HTML mailto link"""
    return "<a href=\"mailto:" + to + "?subject=" + quote(subj) + "\">" + text + "</a>"

args = sys.argv
if len(args) == 2:
    print(make_link(email_addr, make_subject(args[1]), link_text))
else:
    print("Usage: " + args[0] + " \"insert post title here\"")

#jl
