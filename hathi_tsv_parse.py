#!/usr/bin/python

import sys

def main():

    report = open("/tmp/id_list.tsv", 'rU')
    target1 = open("/home/alex/Dropbox/Hathi/emu_mpm_wd", 'w')
    target2 = open("/home/alex/Dropbox/Hathi/emu_spm_wd", 'w')

    for r in report:
        r = r.rstrip('\n')
        r_array = r.split("	")
        if r_array[0]:
            if len(r_array[4]):
                target1.write(r + "\n")
            else:
                target2.write(r + "\n")
        else:
            sys.stderr.write("no OCLC number available for " + r + "\n")

    report.close()
    target1.close()
    target2.close()

if __name__=="__main__":
    sys.exit(main())
