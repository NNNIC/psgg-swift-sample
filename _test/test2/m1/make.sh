
cd `dirname $0`
swiftc -o test  main.swift TestControl.swift
./test