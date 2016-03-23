#!/usr/bin/env bats

setup() {
  mail_without_label_path=${BATS_TEST_DIRNAME}/mail_without_label
  mail_label1_path=${BATS_TEST_DIRNAME}/mail_label1
  mail_label1_label2_path=${BATS_TEST_DIRNAME}/mail_label1_label2
  mail_label2_path=${BATS_TEST_DIRNAME}/mail_label2

  mail="$(cat ${mail_without_label_path})"
  mail_label1="$(cat ${mail_label1_path})"
  mail_label1_label2="$(cat ${mail_label1_label2_path})"
  mail_label2="$(cat ${mail_label2_path})"
}

@test "adding a label to a mail without label" {
  run ./mxl -a "label1" < $mail_without_label_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_label1" ]
}

@test "adding a label to a mail with a label" {
  run ./mxl -a "label2" < $mail_label1_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_label1_label2" ]
}

@test "adding a label already in a mail with one label" {
  run ./mxl -a "label1" < $mail_label1_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_label1" ]
}

@test "adding a label already in the first position" {
  run ./mxl -a "label1" < $mail_label1_label2_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_label1_label2" ]
}

@test "adding a label already in the last position" {
  run ./mxl -a "label2" < $mail_label1_label2_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_label1_label2" ]
}

@test "removing a label that is in the last positon" {
  run ./mxl -r "label2" < $mail_label1_label2_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_label1" ]
}

@test "removing a label that is in the first positon" {
  run ./mxl -r "label1" < $mail_label1_label2_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_label2" ]
}


@test "removing a label that is not here" {
  run ./mxl -r "label2" < $mail_label1_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_label1" ]
}

@test "removing the last label of an e-mail" {
  run ./mxl -r "label1" < $mail_label1_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_without_label" ]
}

@test "remove a label from a mail without X-Label" {
  run ./mxl -r "label1" < $mail_without_label_path
  [ "$status" -eq 1 ]
  [ "$output" = "$mail_without_label" ]
}
