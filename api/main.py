from fastapi import FastAPI
from v1.routers import router
from mangum import Mangum

app = FastAPI(title='Cryptocurrency API',
              description='API to track current prices and trading signals')
app.include_router(router, prefix="/v1")


@app.get("/")
def read_root():
    return {"Hello Medium Reader": "from FastAPI & API Gateway"}


# to make it work with Amazon Lambda, we create a handler object
handler = Mangum(app=app)
