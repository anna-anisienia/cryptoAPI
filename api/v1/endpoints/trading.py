from fastapi import APIRouter
import requests

router = APIRouter()


@router.get("/trading/{crypto}")
async def get_trading_signals(crypto: str):
    """ Get market sentiment:
    * if bullish, prices are expected to rise - optimistic
    * if bearish, prices are expected to fall - pessimistic """
    r = requests.get(f"https://min-api.cryptocompare.com/data/tradingsignals/intotheblock/latest?fsym={crypto}")
    data = r.json()
    trading_signals = data['Data']
    return trading_signals
