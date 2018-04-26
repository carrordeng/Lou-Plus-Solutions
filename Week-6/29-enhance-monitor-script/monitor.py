#!/user/bin/env python
# -*- coding: utf-8 -*-


import os
import sys
import glob

PROC_FILE = {
    'tcp': '/proc/net/tcp',
    'tcp6': '/proc/net/tcp6',
    'udp': '/proc/net/udp',
    'udp6': '/proc/net/udp6'
}

STATUS = {
    '01': 'ESTABLISHED',
    '02': 'SYN_SENT',
    '03': 'SYN_RECV',
    '04': 'FIN_WAIT1',
    '05': 'FIN_WAIT2',
    '06': 'TIME_WAIT',
    '07': 'CLOSE',
    '08': 'CLOSE_WAIT',
    '09': 'LAST_ACK',
    '0A': 'LISTEN',
    '0B': 'CLOSING'
}


PROTOCALS = (
        "tcp",
        "tcp6",
        "udp",
        "udp6"
        )


def get_content(type):
    with open(PROC_FILE[type], 'r') as file:
        content = file.readlines()
        content.pop(0)
        return content


def get_program_name(pid):
    path = '/proc/' + str(pid) + '/comm'
    with open(path, 'r') as file:
        content = file.read()
    content = content.strip()
    return content


def convert_ip_port(ip_port):
    ip, port = ip_port.split(':')
    port = int(port, 16)
    ip = [str(int(ip[6:8], 16)), str(int(ip[4:6], 16)), str(int(ip[2:4], 16)),
          str(int(ip[0:2], 16))]
    ip = '.'.join(ip)
    return ip, port


def get_pid(inode):
    for path in glob.glob('/proc/[1-9]*/fd/[1-9]*'):
        try:
            if str(inode) in os.readlink(path):
                return path.split('/')[2]
            else:
                continue
        except:
            pass
    return None


def main(CHOOSE):
    templ = "%-5s %-30s %-30s %-13s %-6s %s"
    print(templ % (
        "Proto", "Local address", "Remote address", "Status", "PID",
        "Program name"))
    for choose in CHOOSE:
        content = get_content(choose)
        for info in content:
            iterms = info.split(' ')
            iterms_list = [x for x in iterms if x != '']
            proto = choose
            local_address = "%s:%s" % convert_ip_port(iterms_list[1])
            status = STATUS[iterms_list[3]]
            if status == 'LISTEN':
                remote_address = '-'
            else:
                remote_address = "%s:%s" % convert_ip_port(iterms_list[2])
            pid = get_pid(iterms_list[9])
            program_name = ''
            if pid:
                program_name = get_program_name(pid)
            print(templ % (
                proto,
                local_address,
                remote_address,
                status,
                pid or '-',
                program_name or '-',
            ))


if __name__ == '__main__':
    CHOICE = list()
    if len(sys.argv) == 1:
        CHOICE.append("all")
    elif len(sys.argv) == 2 and sys.argv[1] == "all":
        CHOICE.append("all")
    else:
        for i in range(1, len(sys.argv)):
            CHOICE.append(sys.argv[i])
    CHOOSE = list()
    if CHOICE[0] == "all":
        for item in PROTOCALS:
            CHOOSE.append(item)
    else:
        for item in CHOICE:
            CHOOSE.append(item)
    main(CHOOSE)
