//
//  xcode_redirect.hpp
//
//  Created by Marcus Darden on 1/13/19.
//  Copyright © 2019 Marcus Darden. All rights reserved.
//
// Usage: add the following line to main().
//    xcode_redirect(argc, argv);

#ifndef xcode_redirect_hpp
#define xcode_redirect_hpp

#include <iostream>
#include <cstdio>
#include <cstring>

inline char *get_filename_and_move_count(int &optind, char *argv[], int &move_count);
inline void rotate_argv(int move_count, char *argv[], int &optind, int &argc);

// REQUIRES: argc & argv from main(), and optind from getopt.h (optional)
// MODIFIES: optind is incremented until it equals argc
//           argc is decremented to discount any redirected members of argv
// EFFECTS:
//     Looks for extra arguments after getopt() finishes reading options.
//     It replaces simple shell functionality by using freopen() to change
//     stdin (from < infilename or <infilename),
//     stdout (from > outfilename or >outfilename), and/or
//     stderr (from 2> errfilename or 2>errfilename).
inline void xcode_redirect(int &argc, char *argv[], int optind = 1) {
    char *infile = nullptr, *outfile = nullptr, *errfile = nullptr;
    int move_count = 0;
    while (optind < argc) {
        switch (*argv[optind]) {
            case '<':  // redirect input formatted as '< file' or '<file'
                infile = get_filename_and_move_count(optind, argv, move_count);
                if (!freopen(infile, "r", stdin)) {
                    std::cerr << "Unable to open input file: " << infile << std::endl;
                    exit(1);
                }  // if
                break;
            case '>':  // redirect output formatted as '> file' or '>file'
                outfile = get_filename_and_move_count(optind, argv, move_count);
                if (!freopen(outfile, "w", stdout)) {
                    std::cerr << "Unable to open output file: " << outfile << std::endl;
                    exit(1);
                }  // if
                break;
            case '2':  // redirect error formatted as '2> file' or '2>file'
                if (*(argv[optind] + 1) == '>') {
                    errfile = get_filename_and_move_count(optind, argv, move_count);
                    if (!freopen(errfile, "w", stderr)) {
                        std::cerr << "Unable to open error file: " << errfile << std::endl;
                        exit(1);
                    }  // if
                }  // if
                break;
            default:  // not a redirection parameter
                move_count = 0;
        }  // switch
        ++optind;
        if (move_count > 0) {
            rotate_argv(move_count, argv, optind, argc);
        }
    }  // while
}  // xcode_redirect()

inline void rotate_argv(int move_count, char *argv[], int &optind, int &argc) {
    int moveind = optind - move_count;
    char *temp_pre1 = argv[moveind];
    char *temp_pre2 = argv[moveind + 1];
    while (moveind + move_count < argc) {
        argv[moveind] = argv[moveind + move_count];
        ++moveind;
    }  // while
    argv[moveind++] = temp_pre1;
    if (move_count == 2) {
        argv[moveind] = temp_pre2;
    }  // if
    optind -= move_count;
    argc -= move_count;
}  // rotate_argv()

inline char *get_filename_and_move_count(int &optind, char *argv[], int &move_count) {
    if (strlen(argv[optind]) > 2) {
        move_count = 1;
        // Must offset by 1 character (the <), offset by more if they put space(s) before filename
        int offset = 1;
        // Must also offset more for 2> (redirecting error output)
        if (argv[optind][0] == '2')
            ++offset;
        while (argv[optind][offset] == ' ')
            ++offset;
        return argv[optind] + offset;
    }  // if
    move_count = 2;
    return argv[++optind];
}  // get_filename_and_move_count()

#endif /* xcode_redirect_hpp */
