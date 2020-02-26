"=============================================================================
" What Is This: Diary
" File: diary.vim
" Author: Yasuhiro Matsumoto <mattn.jp@gmail.com>
" Last Change: 2013 Okt 27
" Version: 2.9
" Thanks:
"     Tobias Columbus               : customizable key bindings
"     Daniel P. Wright              : doc/diary.txt
"     SethMilliken                  : gave a hint for 2.4
"     bw1                           : bug fix, new weeknm format
"     Ingo Karkat                   : bug fix
"     Thinca                        : bug report, bug fix
"     Yu Pei                        : bug report
"     Per Winkvist                  : bug fix
"     Serge (gentoosiast) Koksharov : bug fix
"     Vitor Antunes                 : bug fix
"     Olivier Mengue                : bug fix
"     Noel Henson                   : today action
"     Per Winkvist                  : bug report
"     Peter Findeisen               : bug fix
"     Chip Campbell                 : gave a hint for 1.3z
"     PAN Shizhu                    : gave a hint for 1.3y
"     Eric Wald                     : bug fix
"     Sascha Wuestemann             : advise
"     Linas Vasiliauskas            : bug report
"     Per Winkvist                  : bug report
"     Ronald Hoelwarth              : gave a hint for 1.3s
"     Vikas Agnihotri               : bug report
"     Steve Hall                    : gave a hint for 1.3q
"     James Devenish                : bug fix
"     Carl Mueller                  : gave a hint for 1.3o
"     Klaus Fabritius               : bug fix
"     Stucki                        : gave a hint for 1.3m
"     Rosta                         : bug report
"     Richard Bair                  : bug report
"     Yin Hao Liew                  : bug report
"     Bill McCarthy                 : bug fix and gave a hint
"     Srinath Avadhanula            : bug fix
"     Ronald Hoellwarth             : few advices
"     Juan Orlandini                : added higlighting of days with data
"     Ray                           : bug fix
"     Ralf.Schandl                  : gave a hint for 1.3
"     Bhaskar Karambelkar           : bug fix
"     Suresh Govindachar            : gave a hint for 1.2, bug fix
"     Michael Geddes                : bug fix
"     Leif Wickland                 : bug fix
" ChangeLog:
"     2.8  : bug fix
"     2.7  : vim7ish, customizable key bindings
"     2.6  : new week number format
"     2.5  : bug fix, 7.2 don't have relativenumber.
"     2.4  : added g:diary_options.
"     2.3  : week number like ISO8601
"            g:diary_monday and g:diary_weeknm work together
"     2.2  : http://gist.github.com/355513#file_customizable_keymap.diff
"            http://gist.github.com/355513#file_winfixwidth.diff
"     2.1  : bug fix, set filetype 'diary'.
"     2.0  : bug fix, many bug fix and enhancements.
"     1.9  : bug fix, use nnoremap.
"     1.8  : bug fix, E382 when close diary.
"     1.7  : bug fix, week number was broken on 2008.
"     1.6  : added diary_begin action.
"            added diary_end action.
"     1.5  : bug fix, fixed ruler formating with strpart.
"            bug fix, using winfixheight.
"     1.4a : bug fix, week number was broken on 2005.
"            added diary_today action.
"            bug fix, about wrapscan.
"            bug fix, about today mark.
"            bug fix, about today navigation.
"     1.4  : bug fix, and one improvement.
"            bug 1:
"              when marking the current date, there is not distinguished e.g. between
"              20041103 and 20040113, both dates are marked as today
"            bug 2:
"              the navigation mark "today" doesn't work
"            improvement:
"              the mapping t worked only when today was displayed, now it works always
"              and redisplays the cuurent month and today
"     1.3z : few changes
"            asign <Left>, <Right> for navigation.
"            set ws for search navigation.
"            add tag for GetLatestVimScripts(AutoInstall)
"     1.3y : bug fix, few changes
"            changed color syntax name. (ex. CalNavi, see bottom of this)
"            changed a map DiaryV for <Leader>cal
"            changed a map DiaryH for <Leader>caL
"            (competitive map for cvscommand.vim)
"            the date on the right-hand side didn't work correctoly.
"            make a map to rebuild Diary window(r).
"     1.3x : bug fix
"            viweek can't refer when not set diary_weeknm.
"     1.3w : bug fix
"            on leap year, week number decreases.
"     1.3v : bug fix
"            add nowrapscan
"            use s:bufautocommandsset for making title
"            don't focus to navi when doubleclick bottom next>.
"     1.3u : bug fix
"             when enter diary first time,
"              it don't warn that you don't have diary directory.
"     1.3t : bug fix
"             make sure the variables for help
"     1.3s : bug fix
"             make a map DiaryV for <Leader>ca
"            add option diary_navi_label
"             see Additional:
"            add option diary_focus_today
"             see Additional:
"            add map ? for help
"     1.3r : bug fix
"             if clicked navigator, cursor go to strange position.
"     1.3q : bug fix
"             coundn't set diary_navi
"              in its horizontal direction
"     1.3p : bug fix
"             coundn't edit diary when the diary is
"              in its horizontal direction
"     1.3o : add option diary_mark, and delete diary_rmark
"             see Additional:
"            add option diary_navi
"             see Additional:
"     1.3n : bug fix
"             s:DiarySign() should use filereadable(expand(sfile)).
"     1.3m : tuning
"             using topleft or botright for opening Diary.
"            use filereadable for s:DiarySign().
"     1.3l : bug fix
"             if set diary_monday, it can see that Sep 1st is Sat
"               as well as Aug 31st.
"     1.3k : bug fix
"             it didn't escape the file name on diary.
"     1.3j : support for fixed Gregorian
"             added the part of Sep 1752.
"     1.3i : bug fix
"             Calculation mistake for week number.
"     1.3h : add option for position of displaying '*' or '+'.
"             see Additional:
"     1.3g : centering header
"            add option for show name of era.
"             see Additional:
"            bug fix
"             <Leader>ca didn't show current month.
"     1.3f : bug fix
"            there was yet another bug of today's sign.
"     1.3e : added usage for <Leader>
"            support handler for sign.
"            see Additional:
"     1.3d : added higlighting of days that have diary data associated
"             with it.
"            bug fix for calculates date.
"     1.3c : bug fix for MakeDir()
"            if DiaryMakeDir(sfile) != 0
"               v
"            if s:DiaryMakeDir(sfile) != 0
"     1.3b : bug fix for diary_monday.
"            it didn't work g:diary_monday correctly.
"            add g:diary_version.
"            add argument on action handler.
"            see Additional:
"     1.3a : bug fix for MakeDir().
"            it was not able to make directory.
"     1.3  : support handler for action.
"            see Additional:
"     1.2g : bug fix for today's sign.
"            it could not display today's sign correctly.
"     1.2f : bug fix for current Date.
"            vtoday variable calculates date as 'YYYYMMDD'
"            while the loop calculates date as 'YYYYMMD' i.e just 1 digit
"            for date if < 10 so if current date is < 10 , the if condiction
"            to check for current date fails and current date is not
"            highlighted.
"            simple solution changed vtoday calculation line divide the
"            current-date by 1 so as to get 1 digit date.
"     1.2e : change the way for setting title.
"            auto configuration for g:diary_wruler with g:diary_monday
"     1.2d : add option for show week number.
"              let g:diary_weeknm = 1
"            add separator if horizontal.
"            change all option's name
"              g:diary_mnth -> g:diary_mruler
"              g:diary_week -> g:diary_wruler
"              g:diary_smnd -> g:diary_monday
"     1.2c : add option for that the week starts with monday.
"              let g:diary_smnd = 1
"     1.2b : bug fix for modifiable.
"            setlocal nomodifiable (was set)
"     1.2a : add default options.
"            nonumber,foldcolumn=0,nowrap... as making gap
"     1.2  : support wide display.
"            add a command DiaryH
"            add map <s-left> <s-right>
"     1.1c : extra.
"            add a titlestring for today.
"     1.1b : bug fix by Michael Geddes.
"            it happend when do ':Calender' twice
"     1.1a : fix misspell.
"            Calender -> Diary
"     1.1  : bug fix.
"            it"s about strftime("%m")
"     1.0a : bug fix by Leif Wickland.
"            it"s about strftime("%w")
"     1.0  : first release.
" TODO:
"     add the option for diary which is separate or single file.
" GetLatestVimScripts: 52 1 :AutoInstall: diary.vim

if &compatible
  finish
endif
"*****************************************************************
"* Diary commands
"*****************************************************************
command! -nargs=* Diary  call diary#show(0,<f-args>)
command! -nargs=* DiaryVR  call diary#show(3,<f-args>)
command! -nargs=* DiaryH call diary#show(1,<f-args>)
command! -nargs=* DiaryT call diary#show(2,<f-args>)

if !get(g:, 'diary_no_mappings', 0)
  if !hasmapto('<Plug>DiaryV')
    nmap <unique> <Leader>cal <Plug>DiaryV
  endif
  if !hasmapto('<Plug>DiaryH')
    nmap <unique> <Leader>caL <Plug>DiaryH
  endif
endif
nnoremap <silent> <Plug>DiaryV :cal diary#show(0)<CR>
nnoremap <silent> <Plug>DiaryH :cal diary#show(1)<CR>
nnoremap <silent> <Plug>DiaryT :cal diary#show(2)<CR>

" vi: et sw=2 ts=2
