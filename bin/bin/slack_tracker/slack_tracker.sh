#!/usr/bin/env bash
function usage {
   cat << EOF
Usage: slack_tracker.sh 

-c : count slack-pings
-v : verbose slack-pings
-k : kill weechat-headless

Display slack-pings inside a terminal
EOF

   exit 1
}

DIR="$HOME/bin/slack_tracker"
LOGS_FILE="$DIR/slack_tracker.log"
RUST_BIN="$DIR/slack-relay"
START=1
KILL=0
VERBOSE=0
COUNT=0

DATE='date +"%Y-%m-%dT%H:%M:%S%z"'

# accept only one flag
if [ "$#" -gt 1 ]; then
  usage
fi

# a flag -v or -c means do not START weechat, only query it
if [ "$1" = "-v" ]; then
  VERBOSE=1
  START=0
fi

if [ "$1" = "-c" ]; then
  COUNT=1
  START=0
fi

if [ "$1" = "-k" ]; then
  KILL=1
  START=0
fi

if ! [ -d $DIR ]; then
  echo "Missing directory $DIR"
  exit 1
fi

if ! [ -x  $RUST_BIN ]; then
  echo "Missing rust slack-relay binary in $DIR"
  exit 1
fi

if ! [ -f  $LOGS_FILE ]; then
  echo "[LOGS]" > $LOGS_FILE
fi

if ! [ -x  $(command -v weechat-headless) ]; then
  echo "Missing weechat binary in PATH"
fi

IS_WEECHAT_RELAY_ACTIVE=$(lsof -iTCP -sTCP:LISTEN -n -P | grep -E '^weechat.*8000 \(LISTEN\)$')

# KILL CASE
if [ $KILL -eq 1 ]; then
  if ! [ -z "$IS_WEECHAT_RELAY_ACTIVE" ]; then
    echo "$(eval $DATE) Killing weechat..." >> $LOGS_FILE
    WEECHAT_PID=$(ps aux | grep 'weechat' | head -n1 | tr -s " " | cut -d' ' -f2)
    kill -9 "$WEECHAT_PID"
    echo "$(eval $DATE) Killed weechat with status $?" >> $LOGS_FILE
    exit 0
  else
    exit 0
  fi
fi

# START CASE
if [ $START -eq 1 ]; then
  if [ -z "$IS_WEECHAT_RELAY_ACTIVE" ]; then
      echo "$(eval $DATE) Starting weechat..." >> $LOGS_FILE
      weechat-headless --daemon > /dev/null
      echo "$(eval $DATE) Started weechat-headless with status $?" >> $LOGS_FILE
      # loading
      echo "..."
  fi
fi

# OTHER CASES
if ! [ -z "$IS_WEECHAT_RELAY_ACTIVE" ]; then

  if [ $VERBOSE -eq 0 ]; then
    RES=$($RUST_BIN | jq '.prio_3_count, .prio_2_count, .prio_1_count' | tr '\n' ' ')
    echo $RES
  else
    $RUST_BIN | jq
  fi

else
  echo "-"
fi

