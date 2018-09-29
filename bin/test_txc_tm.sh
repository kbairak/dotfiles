#!/usr/bin/env bash
echo === Delete project if it pre-exists ===
http --session txc DELETE https://www.transifex.com/api/2/project/kb_tm_test/

echo === Create project \(with fillups enabled\) ===
http --session txc POST https://www.transifex.com/api/2/projects\
  organization=kb_org slug=kb_tm_test source_language_code=en\
  fill_up_resources:=true name=kb_tm_test description=kb_tm_test private:=true

echo === Add the greek language ===
http --session txc POST https://www.transifex.com/api/2/project/kb_tm_test/languages/\
  language_code=el coordinators:='["kbairak"]'

echo === Create the first resource ===
http --session txc POST https://www.transifex.com/api/2/project/kb_tm_test/resources/\
  slug=a name=a i18n_type=KEYVALUEJSON content='["aaa", "bbb", "ccc"]'

echo === \"Translate\" it \(to fill up the project\'s TM\) ===
http --session txc PUT https://www.transifex.com/api/2/project/kb_tm_test/resource/a/translation/el/\
  content='["AAA", "BBB", "CCC"]'

echo === Wait a bit for TM to do its thing in transifex ===
sleep 60

echo === Create the second resource, ideally it should fill up from TM ===
http --session txc POST https://www.transifex.com/api/2/project/kb_tm_test/resources/\
  slug=b name=b i18n_type=KEYVALUEJSON content='["aaa", "bbb", "ccc"]'

echo === Verify that the translations were filled ===
http --session txc https://www.transifex.com/api/2/project/kb_tm_test/resource/b/translation/el/

echo === Delete project \(Don\'t leave trash around\) ===
http --session txc DELETE https://www.transifex.com/api/2/project/kb_tm_test/
