#! /usr/bin/env sh
LOG="$(date "+[%Y-%m-%d %T %z] [entrypoint] [INFO]")"

if [ -z $ENVIRONMENT ] || [ "$ENVIRONMENT" = "dev" ]; then
    ENVIRONMENT="dev"
fi

echo "$LOG ==========================="
echo "$LOG Environment: $ENVIRONMENT"
echo "$LOG ==========================="

echo "$LOG Running gunicorn..."

if [ "$ENVIRONMENT" = "dev" ]; then
    # Expand path to local versions of packages
    export PYTHONPATH=$PYTHONPATH:./py-substrate-interface/:./py-scale-codec/

    gunicorn -b 0.0.0.0:8000 --workers=1 app.main:app --reload --timeout 600
fi

if [ "$ENVIRONMENT" = "prod" ]; then
    gunicorn -b 0.0.0.0:8000 --workers=5 app.main:app --worker-class="egg:meinheld#gunicorn_worker"
fi
