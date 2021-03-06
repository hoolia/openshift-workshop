TERMINAL_IMAGE=registry.chp.belastingdienst.nl/learn/workshop-terminal:3.4.2
DASHBOARD_IMAGE=registry.chp.belastingdienst.nl/learn/workshop-dashboard:5.0.0
SPAWNER_IMAGE=registry.chp.belastingdienst.nl/learn/workshop-spawner:7.0.1
CONSOLE_IMAGE=registry.chp.belastingdienst.nl/learn/origin-console:4.2
PAUSE_IMAGE=registry.chp.belastingdienst.nl/learn/pause

NAME_PREFIX=

HOMEROOM_NAME=homeroom
WORKSHOP_TITLE=
WORKSHOP_DESCRIPTION=

#TEMPLATE_REPO=https://raw.githubusercontent.com/hoolia/openshift-workshop
TEMPLATE_REPO=.
SPAWNER_REPO=workshop-spawner
SPAWNER_VERSION=7.0.1
SPAWNER_MODE=learning-portal
SPAWNER_VARIANT=production
SPAWNER_ROLE=admin
SPAWNER_PASSWORD=

DASHBOARD_REPO=workshop-dashboard
DASHBOARD_VERSION=5.0.0
DASHBOARD_MODE=
DASHBOARD_VARIANT=production

DOWNLOAD_URL=
WORKSHOP_FILE=

WORKSHOP_MEMORY=512Mi
RESOURCE_BUDGET=medium
SERVER_LIMIT=0
MAX_SESSION_AGE=3600
IDLE_TIMEOUT=300
LETS_ENCRYPT=false
PREPULL_IMAGES=true
