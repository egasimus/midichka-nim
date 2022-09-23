#
#
#            Nim's Runtime Library
#        (c) Copyright 2015 Andreas Rumpf
#
#    See the file "copying.txt", included in this
#    distribution, for details about the copyright.
#

import ./posix

type
  Speed* = cuint
  Cflag* = cuint

const
  NCCS* = when defined(macosx): 20 else: 32

when defined(linux) and defined(amd64):
  type
    Termios* {.importc: "struct termios", .} = object
      c_iflag*: Cflag        # input mode flags
      c_oflag*: Cflag        # output mode flags
      c_cflag*: Cflag        # control mode flags
      c_lflag*: Cflag        # local mode flags
      c_line*: cuchar
      c_cc*: array[NCCS, cuchar]  # control characters
      c_ispeed*: Speed
      c_ospeed*: Speed
else:
  type
    Termios* {.importc: "struct termios", .} = object
      c_iflag*: Cflag        # input mode flags
      c_oflag*: Cflag        # output mode flags
      c_cflag*: Cflag        # control mode flags
      c_lflag*: Cflag        # local mode flags
      c_cc*: array[NCCS, cuchar]  # control characters

# cc characters

var
  VINTR*  {. importc, nodecl .}: cint
  VQUIT*  {. importc, nodecl .}: cint
  VERASE* {. importc, nodecl .}: cint
  VKILL*  {. importc, nodecl .}: cint
  VEOF*   {. importc, nodecl .}: cint
  VTIME*  {. importc, nodecl .}: cint
  VMIN*   {. importc, nodecl .}: cint
  VSTART* {. importc, nodecl .}: cint
  VSTOP*  {. importc, nodecl .}: cint
  VSUSP*  {. importc, nodecl .}: cint
  VEOL*   {. importc, nodecl .}: cint

# iflag bits

var
  IGNBRK* {. importc, nodecl .}: Cflag
  BRKINT* {. importc, nodecl .}: Cflag
  IGNPAR* {. importc, nodecl .}: Cflag
  PARMRK* {. importc, nodecl .}: Cflag
  INPCK*  {. importc, nodecl .}: Cflag
  ISTRIP* {. importc, nodecl .}: Cflag
  INLCR*  {. importc, nodecl .}: Cflag
  IGNCR*  {. importc, nodecl .}: Cflag
  ICRNL*  {. importc, nodecl .}: Cflag
  IUCLC*  {. importc, nodecl .}: Cflag
  IXON*   {. importc, nodecl .}: Cflag
  IXANY*  {. importc, nodecl .}: Cflag
  IXOFF*  {. importc, nodecl .}: Cflag

# oflag bits

var
  OPOST*  {. importc, nodecl .}: Cflag
  ONLCR*  {. importc, nodecl .}: Cflag
  OCRNL*  {. importc, nodecl .}: Cflag
  ONOCR*  {. importc, nodecl .}: Cflag
  ONLRET* {. importc, nodecl .}: Cflag
  OFILL*  {. importc, nodecl .}: Cflag
  OFDEL*  {. importc, nodecl .}: Cflag
  NLDLY*  {. importc, nodecl .}: Cflag
  NL0*    {. importc, nodecl .}: Cflag
  NL1*    {. importc, nodecl .}: Cflag
  CRDLY*  {. importc, nodecl .}: Cflag
  CR0*    {. importc, nodecl .}: Cflag
  CR1*    {. importc, nodecl .}: Cflag
  CR2*    {. importc, nodecl .}: Cflag
  CR3*    {. importc, nodecl .}: Cflag
  TABDLY* {. importc, nodecl .}: Cflag
  TAB0*   {. importc, nodecl .}: Cflag
  TAB1*   {. importc, nodecl .}: Cflag
  TAB2*   {. importc, nodecl .}: Cflag
  TAB3*   {. importc, nodecl .}: Cflag
  BSDLY*  {. importc, nodecl .}: Cflag
  BS0*    {. importc, nodecl .}: Cflag
  BS1*    {. importc, nodecl .}: Cflag
  FFDLY*  {. importc, nodecl .}: Cflag
  FF0*    {. importc, nodecl .}: Cflag
  FF1*    {. importc, nodecl .}: Cflag
  VTDLY*  {. importc, nodecl .}: Cflag
  VT0*    {. importc, nodecl .}: Cflag
  VT1*    {. importc, nodecl .}: Cflag

# cflag bit meaning

var
  B0*       {.importc, nodecl.}: Speed
  B50*      {.importc, nodecl.}: Speed
  B75*      {.importc, nodecl.}: Speed
  B110*     {.importc, nodecl.}: Speed
  B134*     {.importc, nodecl.}: Speed
  B150*     {.importc, nodecl.}: Speed
  B200*     {.importc, nodecl.}: Speed
  B300*     {.importc, nodecl.}: Speed
  B600*     {.importc, nodecl.}: Speed
  B1200*    {.importc, nodecl.}: Speed
  B1800*    {.importc, nodecl.}: Speed
  B2400*    {.importc, nodecl.}: Speed
  B4800*    {.importc, nodecl.}: Speed
  B9600*    {.importc, nodecl.}: Speed
  B19200*   {.importc, nodecl.}: Speed
  B38400*   {.importc, nodecl.}: Speed
  B57600*   {.importc, nodecl.}: Speed
  B115200*  {.importc, nodecl.}: Speed
  B230400*  {.importc, nodecl.}: Speed
  B460800*  {.importc, nodecl.}: Speed
  B500000*  {.importc, nodecl.}: Speed
  B576000*  {.importc, nodecl.}: Speed
  B921600*  {.importc, nodecl.}: Speed
  B1000000* {.importc, nodecl.}: Speed
  B1152000* {.importc, nodecl.}: Speed
  B1500000* {.importc, nodecl.}: Speed
  B2000000* {.importc, nodecl.}: Speed
  B2500000* {.importc, nodecl.}: Speed
  B3000000* {.importc, nodecl.}: Speed
  B3500000* {.importc, nodecl.}: Speed
  B4000000* {.importc, nodecl.}: Speed
  EXTA*     {.importc, nodecl.}: Speed
  EXTB*     {.importc, nodecl.}: Speed
  CSIZE*    {.importc, nodecl.}: Cflag
  CS5*      {.importc, nodecl.}: Cflag
  CS6*      {.importc, nodecl.}: Cflag
  CS7*      {.importc, nodecl.}: Cflag
  CS8*      {.importc, nodecl.}: Cflag
  CSTOPB*   {.importc, nodecl.}: Cflag
  CREAD*    {.importc, nodecl.}: Cflag
  PARENB*   {.importc, nodecl.}: Cflag
  PARODD*   {.importc, nodecl.}: Cflag
  HUPCL*    {.importc, nodecl.}: Cflag
  CLOCAL*   {.importc, nodecl.}: Cflag

# lflag bits

var
  ISIG*   {.importc, nodecl.}: Cflag
  ICANON* {.importc, nodecl.}: Cflag
  ECHO*   {.importc, nodecl.}: Cflag
  ECHOE*  {.importc, nodecl.}: Cflag
  ECHOK*  {.importc, nodecl.}: Cflag
  ECHONL* {.importc, nodecl.}: Cflag
  NOFLSH* {.importc, nodecl.}: Cflag
  TOSTOP* {.importc, nodecl.}: Cflag
  IEXTEN* {.importc, nodecl.}: Cflag

# tcflow() and TCXONC use these

var
  TCOOFF* {.importc, nodecl.}: cint
  TCOON*  {.importc, nodecl.}: cint
  TCIOFF* {.importc, nodecl.}: cint
  TCION*  {.importc, nodecl.}: cint

# tcflush() and TCFLSH use these

var
  TCIFLUSH*  {.importc, nodecl.}: cint
  TCOFLUSH*  {.importc, nodecl.}: cint
  TCIOFLUSH* {.importc, nodecl.}: cint

# tcsetattr uses these

var
  TCSANOW*   {.importc, nodecl.}: cint
  TCSADRAIN* {.importc, nodecl.}: cint
  TCSAFLUSH* {.importc, nodecl.}: cint

# Compare a character C to a value VAL from the `cc' array in a
#   `struct termios'.  If VAL is _POSIX_VDISABLE, no character can match it.

template cceq*(val, c): untyped =
  c == val and val != POSIX_VDISABLE

# Return the output baud rate stored in *TERMIOS_P.
proc cfGetOspeed*(termios: ptr Termios): Speed {.importc: "cfgetospeed",.}

# Return the input baud rate stored in *TERMIOS_P.
proc cfGetIspeed*(termios: ptr Termios): Speed {.importc: "cfgetispeed",.}

# Set the output baud rate stored in *TERMIOS_P to SPEED.
proc cfSetOspeed*(termios: ptr Termios; speed: Speed): cint {.importc: "cfsetospeed", .}

# Set the input baud rate stored in *TERMIOS_P to SPEED.
proc cfSetIspeed*(termios: ptr Termios; speed: Speed): cint {.importc: "cfsetispeed", .}

# Set both the input and output baud rates in *TERMIOS_OP to SPEED.
proc tcGetAttr*(fd: cint; termios: ptr Termios): cint {.importc: "tcgetattr", .}

# Set the state of FD to *TERMIOS_P.
#   Values for OPTIONAL_ACTIONS (TCSA*) are in <bits/termios.h>.
proc tcSetAttr*(fd: cint; optional_actions: cint; termios: ptr Termios): cint {.importc: "tcsetattr", .}

# Set *TERMIOS_P to indicate raw mode.
proc tcSendBreak*(fd: cint; duration: cint): cint {.importc: "tcsendbreak",.}

# Wait for pending output to be written on FD.
#
#   This function is a cancellation point and therefore not marked with
#  .
proc tcDrain*(fd: cint): cint {.importc: "tcdrain", .}

# Flush pending data on FD.
#   Values for QUEUE_SELECTOR (TC{I,O,IO}FLUSH) are in <bits/termios.h>.
proc tcFlush*(fd: cint; queue_selector: cint): cint {.importc: "tcflush",.}

# Suspend or restart transmission on FD.
#   Values for ACTION (TC[IO]{OFF,ON}) are in <bits/termios.h>.
proc tcFlow*(fd: cint; action: cint): cint {.importc: "tcflow",.}

# Get process group ID for session leader for controlling terminal FD.

# Window size ioctl.  Should work on on any Unix that xterm has been ported to.
var TIOCGWINSZ*{.importc, nodecl.}: culong

when defined(nimHasStyleChecks):
  {.push styleChecks: off.}

type IOctl_WinSize* = object
  ws_row*, ws_col*, ws_xpixel*, ws_ypixel*: cushort

when defined(nimHasStyleChecks):
  {.pop.}

proc ioctl*(fd: cint, request: culong, reply: ptr IOctl_WinSize): int {.
  importc: "ioctl", header: "<stdio.h>", varargs.}
