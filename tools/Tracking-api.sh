## Send Events
curl -X "POST" "http://localhost:8090/send/events?session_id=11111-1111-11112&event_type=drivenDistance&numeric_event_value=1111&event_at=1684327792"

## Send session
curl -X "POST" "http://localhost:8090/send/session?session_id=11111-1111-11112&machine_id=1111-2222-3333&start_at=1684327792" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{}'

## Get Events
curl "http://localhost:8090/machines/1111-2222-3333/sessions/11111-1111-11112/events?session_id=11111-1111-11112&machine_id=1111-2222-3333&start_at=1684327792&pageNo=0&pageSize=2" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{}'
