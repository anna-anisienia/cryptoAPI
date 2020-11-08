from fastapi import APIRouter
from typing import Optional
import requests

router = APIRouter()


@router.get("/prices/{crypto}")
async def get_real_time_prices(crypto: str, currency: Optional[str] = 'USD'):
    """ Get real-time price for the selected cryptocurrency in the currency of your choice"""
    r = requests.get(f"https://min-api.cryptocompare.com/data/price?fsym={crypto}&tsyms={currency}")
    data = r.json()
    return data
